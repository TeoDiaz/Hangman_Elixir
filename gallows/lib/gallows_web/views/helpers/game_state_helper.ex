defmodule Gallows.Views.Helpers.GameStateHelper do

  import Phoenix.HTML, only: [raw: 1]

  @response %{
    :won => { :success, "You Won!"},
    :lost => { :danger, "You Lost!"},
    :good_guess => { :success, "Good guess!"},
    :bad_guess => { :warning, "Bad guess!"},
    :already_used => { :info, "Your already guessed that"}
  }

  def game_state(state) do
    @response[state]
    |> alert()
  end

  defp alert(nil), do: ""
  defp alert({class, message}) do
    """
    <div class="alert alert-#{class}">
    #{message}
    </div>
    """
    |> raw()
  end
end
