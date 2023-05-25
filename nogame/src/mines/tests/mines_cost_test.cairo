#[cfg(test)]
mod MineCostTest {
    use debug::PrintTrait;
    use nogame::mines::library::{pow, steel_mine_cost, quarz_mine_cost, tritium_mine_cost};

    #[test]
    #[available_gas(1000000000)]
    fn fast_power_test() {
        assert(pow(2, 1) == 2, 'invalid result');
        assert(pow(2, 2) == 4, 'invalid result');
        assert(pow(2, 3) == 8, 'invalid result');
        assert(pow(3, 4) == 81, 'invalid result');
        assert(pow(2, 30) == 1073741824, 'invalid result');
        assert(pow(5, 5) == 3125, 'invalid result');
    }
    #[test]
    #[available_gas(1000000000)]
    fn steel_mine_cost_test() {
        let (steel, quarz) = steel_mine_cost(0);
        assert(steel.low == 60 & quarz.low == 15, 'wrong formula');
        let (steel, quarz) = steel_mine_cost(1);
        assert(steel.low == 120 & quarz.low == 30, 'wrong formula');
        let (steel, quarz) = steel_mine_cost(4);
        assert(steel.low == 960 & quarz.low == 240, 'wrong formula');
        let (steel, quarz) = steel_mine_cost(10);
        assert(steel.low == 61440 & quarz.low == 15360, 'wrong formula');
        let (steel, quarz) = steel_mine_cost(20);
        assert(steel.low == 62914560 & quarz.low == 15728640, 'wrong formula');
        let (steel, quarz) = steel_mine_cost(30);
        assert(steel.low == 64424509440 & quarz.low == 16106127360, 'wrong formula');
        let (steel, quarz) = steel_mine_cost(63);
        // Max level before overflow.
        assert(
            steel.low == 553402322211286548480 & quarz.low == 138350580552821637120, 'wrong formula'
        );
    }
    #[test]
    #[available_gas(1000000000)]
    fn quarz_mine_cost_test() {
        let (steel, quarz) = quarz_mine_cost(0);
        assert(steel.low == 48 & quarz.low == 24, 'wrong formula');
        let (steel, quarz) = quarz_mine_cost(1);
        assert(steel.low == 96 & quarz.low == 48, 'wrong formula');
        let (steel, quarz) = quarz_mine_cost(4);
        assert(steel.low == 768 & quarz.low == 384, 'wrong formula');
        let (steel, quarz) = quarz_mine_cost(10);
        assert(steel.low == 49152 & quarz.low == 24576, 'wrong formula');
        let (steel, quarz) = quarz_mine_cost(20);
        assert(steel.low == 50331648 & quarz.low == 25165824, 'wrong formula');
        let (steel, quarz) = quarz_mine_cost(30);
        assert(steel.low == 51539607552 & quarz.low == 25769803776, 'wrong formula');
        let (steel, quarz) = quarz_mine_cost(63);
        // Max level before overflow.
        assert(
            steel.low == 442721857769029238784 & quarz.low == 221360928884514619392, 'wrong formula'
        );
    }
    #[test]
    #[available_gas(1000000000)]
    fn tritium_mine_cost_test() {
        let (steel, quarz) = tritium_mine_cost(0);
        assert(steel.low == 225 & quarz.low == 75, 'wrong formula');
        let (steel, quarz) = tritium_mine_cost(1);
        assert(steel.low == 450 & quarz.low == 150, 'wrong formula');
        let (steel, quarz) = tritium_mine_cost(4);
        assert(steel.low == 3600 & quarz.low == 1200, 'wrong formula');
        let (steel, quarz) = tritium_mine_cost(10);
        assert(steel.low == 230400 & quarz.low == 76800, 'wrong formula');
        let (steel, quarz) = tritium_mine_cost(20);
        assert(steel.low == 235929600 & quarz.low == 78643200, 'wrong formula');
        let (steel, quarz) = tritium_mine_cost(30);
        assert(steel.low == 241591910400 & quarz.low == 80530636800, 'wrong formula');
        // Max level before overflow.
        let (steel, quarz) = tritium_mine_cost(63);
        assert(
            steel.low == 2075258708292324556800 & quarz.low == 691752902764108185600,
            'wrong formula'
        );
    }
}

