<?php

namespace RemoteConnectTest;
 
use phpmock\phpunit\PHPMock;

/** @test */
class RemoteConnectTest
{
  public function testconnectToServer($serverName=null)
  {
    if($serverName==null){
      throw new Exception("That's not a server name!");
    }
    $fp = fsockopen($serverName,80);
    return ($fp) ? true : false;
  }
  /** @test */
 
  public function testreturnSampleObject()
  {
    return $this;
  }
}
?>