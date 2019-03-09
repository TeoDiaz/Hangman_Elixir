defmodule Procs do

  def greeter(count) do
    receive do
      {:boom, reason} ->
        exit(reason)
      {:add, n} ->
        greeter(count+n)
      msg ->
        IO.puts "#{count}: Hello #{inspect msg}"
        greeter(count)
    end
  end

  # spawn Procs, :greeter, ["world"]
  # spawn_link Procs, :greeter, ["world"]
  # MFA is short for Module, Function, Arguments

  @doc """
  spawn creates an isolated process—it is independent of the process that created it. You don’t (by default) receive any notification that it has died.

spawn_link links the creating and created processes. If one dies an abnormal death, the other is killed.

Most of the time, this is the behavior we want. Without it, we’ll leave zombies lying around, an we won’t know that subprocesses have died.
  """

end
