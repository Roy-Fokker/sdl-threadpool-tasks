// #include "BS_thread_pool.hpp"

import std;
import BS.thread_pool;

auto test_task() -> int
{
	return 42;
}

auto main() -> int
{
	auto hw_cores = std::thread::hardware_concurrency();
	auto pool     = BS::thread_pool(hw_cores);

	auto my_future = pool.submit_task(test_task);

	std::println("Number of threads is {}", pool.get_thread_count());
	std::println("The future is {}", my_future.get());
}
