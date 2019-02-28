# coding: utf-8
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = [0, 0];
  for index in 0..nums.length-1
    if (nums.include?(target-nums[index]))
      other_index = nums.index(target-nums[index])
      if (index != other_index)
        return [index, other_index]
      end
    end
  end
  result
end
puts two_sum([3,2,4], 6).to_s;
