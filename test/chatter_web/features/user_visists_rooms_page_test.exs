defmodule ChatterWeb.UserVisitsRoomsPageTest do
  use ChatterWeb.FeatureCase, async: true

  @room_index "/"

  describe "as a user, I would like to see a list of all available chats" do
    test "user visists rooms page to see a list offf rooms", %{session: session} do
      [room1, room2] = insert_pair(:chat_room)

      session
      |> visit(@room_index)
      |> assert_has(room_name(room1))
      |> assert_has(room_name(room2))
    end
  end

  defp room_name(room) do
    Query.data("role", "room", text: room.name)
  end
end
