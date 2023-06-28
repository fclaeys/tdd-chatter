defmodule ChatterWeb.ChatRoomController do
  use ChatterWeb, :controller

  def index(conn, _params) do
    chat_rooms = Chatter.Chat.all_rooms()
    render(conn, :index, layout: false, chat_rooms: chat_rooms)
  end
end
