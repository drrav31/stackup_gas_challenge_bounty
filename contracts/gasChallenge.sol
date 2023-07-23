// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    //Fix the array size to 10 as only 10 elements are present
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        //Cache the array length
        uint arr_length = numbers.length;

        for (uint i = 0; i < arr_length; ) {
            //set value of each array element to 0
            numbers[i] = 0;

            //increment value of i in unchecked block to save gas.
            //as value of i is bounded by the fixed-array length,it'll never overflow
            unchecked {
                ++i;
            }
        }
    }
}
