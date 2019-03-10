defmodule Chain do
  defstruct(
    next_node: nil,
    count: 4
  )

  def start_link(next_node) do
    spawn_link(Chain, :message_loop, [%Chain{next_node: next_node}])
    |> Process.register(:chainer)
  end

  def message_loop(%{count: 0}) do
    IO.puts("done")
  end

  def message_loop(state) do
    receive do
      {:trigger, list} ->
        IO.inspect(list)
        :timer.sleep(500)
        send({:chainer, state.next_node}, {:trigger, [node() | list]})
    end

    message_loop(%{state | count: state.count - 1})
  end
  @doc """
  The way to connect four nodes

  -Open four console window
  -connect each console with the next one
  -Chain.start_link(:"next_node_name") x 4 times
  -send :chainer, {:trigger,[]}

  Observe how the loops goes through the four windows untill it says "done"
  """
end

