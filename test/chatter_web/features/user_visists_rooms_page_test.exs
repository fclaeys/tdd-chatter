defmodule ChatterWeb.UserVisitsRoomsPageTest do
  use ChatterWeb.FeatureCase, async: true

  describe "as a user, I would like to see a list of all available chats" do
    test "user visists rooms page to see a list offf rooms", %{session: session} do
      room = insert(:chat_room)

      session
      |> visit("/")
      |> assert_has(Query.css(".room", text: room.name))
    end
  end
end
