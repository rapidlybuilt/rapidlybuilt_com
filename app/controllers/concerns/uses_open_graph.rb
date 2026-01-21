module UsesOpenGraph
  extend ActiveSupport::Concern

  included do
    helper_method :open_graph
    helper_method :open_graph?

    before_action :set_open_graph_defaults
  end

  def open_graph
    @open_graph ||= RapidUI::Layout::Head::OpenGraph.new(factory: RapidUI::Factory.new)
  end

  def open_graph?
    @open_graph.present?
  end

  def set_open_graph_defaults
    open_graph.url = request.original_url
    open_graph.domain = request.host
    open_graph.type = "website"
    open_graph.title = "Rapidly Built"
    open_graph.description = "Build in the open. Share what works."
    open_graph.image_url = view_context.image_url("opengraph.png")
  end
end
