require "./spec_helper"

def ticket_comment_hash
  {"ticket_id" => "1", "body" => "Fake"}
end

def ticket_comment_params
  params = [] of String
  params << "ticket_id=#{ticket_comment_hash["ticket_id"]}"
  params << "body=#{ticket_comment_hash["body"]}"
  params.join("&")
end

def create_ticket_comment
  model = TicketComment.new(ticket_comment_hash)
  model.save
  model
end

class TicketCommentControllerTest < GarnetSpec::Controller::Test
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

describe TicketCommentControllerTest do
  subject = TicketCommentControllerTest.new

  it "renders ticket_comment index template" do
    TicketComment.clear
    response = subject.get "/ticket_comments"

    response.status_code.should eq(200)
    response.body.should contain("ticket_comments")
  end

  it "renders ticket_comment show template" do
    TicketComment.clear
    model = create_ticket_comment
    location = "/ticket_comments/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Ticket Comment")
  end

  it "renders ticket_comment new template" do
    TicketComment.clear
    location = "/ticket_comments/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Ticket Comment")
  end

  it "renders ticket_comment edit template" do
    TicketComment.clear
    model = create_ticket_comment
    location = "/ticket_comments/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Ticket Comment")
  end

  it "creates a ticket_comment" do
    TicketComment.clear
    response = subject.post "/ticket_comments", body: ticket_comment_params

    response.headers["Location"].should eq "/ticket_comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a ticket_comment" do
    TicketComment.clear
    model = create_ticket_comment
    response = subject.patch "/ticket_comments/#{model.id}", body: ticket_comment_params

    response.headers["Location"].should eq "/ticket_comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a ticket_comment" do
    TicketComment.clear
    model = create_ticket_comment
    response = subject.delete "/ticket_comments/#{model.id}"

    response.headers["Location"].should eq "/ticket_comments"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
