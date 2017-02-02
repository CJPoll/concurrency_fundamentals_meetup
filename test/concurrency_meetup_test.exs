defmodule ConcurrencyMeetupTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  doctest ConcurrencyMeetup

  describe "create_process" do
    @tag :skip
    test "function exists" do
      ConcurrencyMeetup.create_process
    end

    @tag :skip
    test "creates a live process" do
      pid = ConcurrencyMeetup.create_process
      assert is_pid(pid)
    end

    @tag :skip
    test "process prints 'Hello to you too!' when sent a :hello message" do
      assert capture_io(fn ->
        pid = ConcurrencyMeetup.create_process
        send(pid, :hello)

        receive do
        after 100 -> :timeout
        end
      end) == "Hello to you too!\n"
    end

    @tag :skip
    test "process dies after processing a single message" do
      capture_io(fn ->
        pid = ConcurrencyMeetup.create_process
        send(pid, :hello)

        receive do
        after 100 -> :timeout
        end

        refute Process.alive?(pid)
      end)
    end
  end

  describe "worker_process" do
    @tag :skip
    test "function exists" do
      ConcurrencyMeetup.worker_process
    end

    @tag :skip
    test "creates a live process" do
      pid = ConcurrencyMeetup.worker_process
      assert is_pid(pid)
    end

    @tag :skip
    test "process prints 'Hello to you too!' when sent a :hello message" do
      assert capture_io(fn ->
        pid = ConcurrencyMeetup.worker_process
        send(pid, :hello)

        receive do
        after 100 -> :timeout
        end
      end) == "Hello to you too!\n"
    end

    @tag :skip
    test "process does not die after processing a single message" do
      capture_io(fn ->
        pid = ConcurrencyMeetup.worker_process
        send(pid, :hello)

        receive do
        after 100 -> :timeout
        end

        assert Process.alive?(pid)
      end)
    end
  end
end
