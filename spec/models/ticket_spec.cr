require "./spec_helper"
require "../../src/models/ticket.cr"

describe Ticket do
  Spec.before_each do
    Ticket.clear
  end
end
