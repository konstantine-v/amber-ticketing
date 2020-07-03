require "./spec_helper"

def ticket_hash
  {"title" => "Fake", "desc" => "Fake", "solved" => "1", "urgency" => "1"}
end

def ticket_params
  params = [] of String
  params << "title=#{ticket_hash["title"]}"
  params << "desc=#{ticket_hash["desc"]}"
  params << "solved=#{ticket_hash["solved"]}"
  params << "urgency=#{ticket_hash["urgency"]}"
  params.join("&")
end

def create_ticket
  model = Ticket.new(ticket_hash)
  model.save
  model
end

class TicketControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe TicketControllerTest do
  subject = TicketControllerTest.new

  it "renders ticket index template" do
    Ticket.clear
    response = subject.get "/tickets"

    response.status_code.should eq(200)
    response.body.should contain("tickets")
  end

  it "renders ticket show template" do
    Ticket.clear
    model = create_ticket
    location = "/tickets/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Ticket")
  end

  it "renders ticket new template" do
    Ticket.clear
    location = "/tickets/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Ticket")
  end

  it "renders ticket edit template" do
    Ticket.clear
    model = create_ticket
    location = "/tickets/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Ticket")
  end

  it "creates a ticket" do
    Ticket.clear
    response = subject.post "/tickets", body: ticket_params

    response.headers["Location"].should eq "/tickets"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a ticket" do
    Ticket.clear
    model = create_ticket
    response = subject.patch "/tickets/#{model.id}", body: ticket_params

    response.headers["Location"].should eq "/tickets"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a ticket" do
    Ticket.clear
    model = create_ticket
    response = subject.delete "/tickets/#{model.id}"

    response.headers["Location"].should eq "/tickets"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
