This is an attempt to solve the CTF in Rinkeby https://rinkeby.etherscan.io/address/0xffb9205c84d0b209c215212a3cdfc50bf1cfb0e0#code using hevm.

The goal is to ask hevm for an input that leads to a high score by asserting "the score is always less than X".
If hevm can prove that this is false, it will give us the input to reach that score.

In the original code, the input is a `bytes memory`. Unfortunately hevm does not support symbolic dynamic types.
However, the input actually has a fixed length of 512, so we can change that to `bytes1[512]`. A few other changes
are required in the library helpers functions to read bytes and integers from the `bytes1[512]` array instead of
a dynamic bytes. The full contract with all the changes is in `PinballHevm.sol`.

The file `Helpers.t.sol` has a few specific tests for those helpers.
The file `Pinball.t.sol` has tests for both the original and hevm contracts. It has a few solutions and scores that
were already sent to the contract, that I use here mainly to get some coverage on the `PinballHevm` contract and
the new helper functions, and to check that I didn't break anything in the original contract.
These are all the functions that start with `test_`.
You can run them with
```
$ dapp test
```
or
```
$ dapp test --verbosity 3
```
to see all the emitted events and the actual final score.

Finally, function `prove_high_score_letsgo` is the one that tries to symbolically find the input leading to a high score
(all functions named `prove_*` run symbolically).
The target score is specified in the assertion at the end of `PinballHevm.sol::play`.
That function is commented out so all the tests pass currently. Uncomment it to see it hang :)

You might also wanna check `dapp test -h` to see the options regarding SMT query timeout and the allowed loop max iterations.
