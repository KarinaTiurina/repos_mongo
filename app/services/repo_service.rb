class RepoService
  def initialize(name:)
    @name = name
  end

  def perform
    create_repo!
    broadcast_repo
  end

  private

  def create_repo!
    @repo ||= Repository.create!(name: @name)
  end

  def broadcast_repo
    ActionCable.server.broadcast "repository_channel", repository: render_repo
  end

  def render_repo
    ApplicationController.renderer.render(partial: 'repositories/repository', locals: {
      repository: @repo
    })
  end
end
