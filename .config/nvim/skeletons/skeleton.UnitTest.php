<?php
declare(strict_types=1);

namespace Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class `!v expand('%:t:r')` extends TestCase
{
    
    // # tests

    /**
     * dataProvider for test$2
     *
     * @return void
     */
    public function $2Provider(): Array
    {
        return [
            [[$4], $5 ]
        ];
    }
    

    /**
     * ${3:A test with no description}
     *
     * @dataProvider $2Provider
     * @return       void
     */
    public function test$2($inputs, $expectedOutput): Void
    {
        $actualOutput = $6(...$inputs);
        $this->assertSame($expectedOutput, $actualOutput);
    }
}
