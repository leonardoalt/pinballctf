pragma solidity ^0.8.6;

import "ds-test/test.sol";

contract HelpersTest is DSTest {

	function setUp() public {
    }

	function test_readBytes4() public {
		bytes1[512] memory ball;
		for (uint i = 0; i < 512; ++i)
			ball[i] = bytes1(uint8(i));
		bytes4 r1 = readBytes4At(ball, 0);
		assertTrue(r1 == bytes4(uint32(0x00010203)));
		bytes4 r2 = readBytes4At(ball, 1);
		assertTrue(r2 == bytes4(uint32(0x01020304)));
		bytes4 r3 = readBytes4At(ball, 5);
		assertEq(bytes32(r3), bytes32(bytes4(uint32(0x05060708))));
	}

	function test_readBytes32() public {
		bytes1[512] memory ball;
		for (uint i = 0; i < 512; ++i)
			ball[i] = bytes1(uint8(i));
		bytes32 r1 = readBytes32At(ball, 0);
		assertEq(r1, bytes32(uint(0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f)));
		bytes32 r2 = readBytes32At(ball, 1);
		assertEq(r2, bytes32(uint(0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20)));
	}

	function readBytes4At(bytes1[512] memory ball, uint dataOffset) internal pure returns (bytes4 result) {
		result = bytes4(ball[dataOffset]);
		result |= bytes4(ball[dataOffset + 1]) >> 8;
		result |= bytes4(ball[dataOffset + 2]) >> 16;
		result |= bytes4(ball[dataOffset + 3]) >> 24;
    }

	function readBytes32At(bytes1[512] memory ball, uint dataOffset) internal pure returns (bytes32 result) {
		result = bytes32(ball[dataOffset]);
		result |= bytes32(ball[dataOffset + 1]) >> 8;
		result |= bytes32(ball[dataOffset + 2]) >> 16;
		result |= bytes32(ball[dataOffset + 3]) >> 24;
		result |= bytes32(ball[dataOffset + 4]) >> 32;
		result |= bytes32(ball[dataOffset + 5]) >> 40;
		result |= bytes32(ball[dataOffset + 6]) >> 48;
		result |= bytes32(ball[dataOffset + 7]) >> 56;
		result |= bytes32(ball[dataOffset + 8]) >> 64;
		result |= bytes32(ball[dataOffset + 9]) >> 72;
		result |= bytes32(ball[dataOffset + 10]) >> 80;
		result |= bytes32(ball[dataOffset + 11]) >> 88;
		result |= bytes32(ball[dataOffset + 12]) >> 96;
		result |= bytes32(ball[dataOffset + 13]) >> 104;
		result |= bytes32(ball[dataOffset + 14]) >> 112;
		result |= bytes32(ball[dataOffset + 15]) >> 120;
		result |= bytes32(ball[dataOffset + 16]) >> 128;
		result |= bytes32(ball[dataOffset + 17]) >> 136;
		result |= bytes32(ball[dataOffset + 18]) >> 144;
		result |= bytes32(ball[dataOffset + 19]) >> 152;
		result |= bytes32(ball[dataOffset + 20]) >> 160;
		result |= bytes32(ball[dataOffset + 21]) >> 168;
		result |= bytes32(ball[dataOffset + 22]) >> 176;
		result |= bytes32(ball[dataOffset + 23]) >> 184;
		result |= bytes32(ball[dataOffset + 24]) >> 192;
		result |= bytes32(ball[dataOffset + 25]) >> 200;
		result |= bytes32(ball[dataOffset + 26]) >> 208;
		result |= bytes32(ball[dataOffset + 27]) >> 216;
		result |= bytes32(ball[dataOffset + 28]) >> 224;
		result |= bytes32(ball[dataOffset + 29]) >> 232;
		result |= bytes32(ball[dataOffset + 30]) >> 240;
		result |= bytes32(ball[dataOffset + 31]) >> 248;
    }
}
