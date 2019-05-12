#!/usr/bin/perl
#############################################################
# @package FLEX BOT - PERL                         #
# @author Ahmad Ishaq <ahmad.ishaq15@gmail.com>   #
# @license GPLV3.0                                          #
# @copyright 2019 StalkersSecurity                          #
# @link https://stalkers.pk                                 #
#############################################################

use warnings;
use strict;
use LWP::Simple;
use Win32::Console;
use Term::ANSIColor;
use Win32::Console::ANSI;
use Try::Tiny;
use Selenium::Remote::Driver;
use Selenium::Remote::WDKeys;
use Selenium::Remote::WebElement;
use Term::ReadKey;
use XML::DOM;

my @array1="'1','2','3','4,'5'";
my $web = 'http://flexstudent.nu.edu.pk';
my $username_xpath='//*[@id="m_inputmask_4"]';
my $password_xpath='//*[@id="pass"]';
my $loginbtn_xpath='//*[@id="m_login_signin_submit"]';
my $course_feedback_xpath = "/html/body/div[1]/div/div[1]/div/div[1]/div/ul/li[8]/a";
my $feedback_submit_btn_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/button/span/span";
my $choice;
system('title Perl BOT');
$SIG{'INT'} = sub
{
   print color("red"),"Programme Terminated!\n",color("reset");
   exit;
};

#Reads and display ascii art from file
print color("BOLD red");
print "\n";
open(my $fh, "ascii.txt") or die("Can't open ascii.txt");
while(my $line = <$fh>) {
    print $line;
}
print color("reset");
close $fh;
#----------------------------------------

#Credits
print color("green"),"[+]",color("blue"),"<----V1.0---->\n",color("reset");
print color("green"),"[+]",color("blue"),"----> CODED BY",color("red")," Ahmad Ishaq",color("blue")," AKA",color("red")," DEXTER\n",color("reset");
print color("green"),"[+]",color("blue"),"----> AUTOMATED FEEDBACK SUBMITTER\n",color("reset");
print "\n";
#----------------------------------------

#Take required Variables as Input from user
print color("green"),"[-]",color("reset"),"website URL [http://url.com] : ";
print "$web \n";
print color("green"), "[+]",color("reset"),"Checking if url Exists ";
my $url = $web;

#Checks if url exists
if (head($url)) {
  print color("green"),"[OK]\n",color("reset");
} else {
  print color("red"),"[NOT]\n",color("reset");
  exit;
}
#----------------------------------------

my $driver = Selenium::Remote::Driver->new();
print color('bold blue');
$driver->get($web);



print color("green"),"[-]",color("reset"),"Enter username [##X-####] e.g 17F-8221 : ";
my $username =<>;
chomp($username);
print color("green"),"[-]",color("reset"),"Enter password : ";
my $pass =<>;
chomp($pass);
print "\n\n";
print color("bold red"),"----->",color("bold blue"),"1. Strongly Agree\n",
color("bold red"),"----->",color("bold blue"),"2. Agree\n",color("bold red"),"----->",color("bold blue"),"3. Uncertain\n",color("bold red"),"----->",
color("bold blue"),"4. Dissatisfied\n",color("bold red"),"----->",color("bold blue"),"5. Strongly Disagree\n",color("bold red"),
"----->",color("bold blue"),"6. Random\n\n";
print color("bold blue"),"Enter ",color("bold red"),"Choice ",color("bold blue"),": ",color("reset");
my $option=<STDIN>;
chomp ($option);


#Execute java script to send keys to input mask
my $script = q{
  var arg1 = arguments[0];
       $('#m_inputmask_4').inputmask("setvalue", arg1);
   };
$driver->execute_script($script,"$username");
#------------------------------------------------


#Starts automated process of Submitting feed back
my $h1 =$driver->find_element($password_xpath);
$h1->send_keys($pass);
my $h2 = $driver->find_element($loginbtn_xpath);
$h2->click();
my $h3 = $driver->find_element($course_feedback_xpath);
 $h3->click();
for(my $j=3;$j<=7;$j++)
{
  if( $j==2 or $j==1)
  {
    my $give_feedback_xpath ="/html/body/div[1]/div/div[2]/div[2]/div/div[2]/div/div/table/tbody/tr[$j]/td[6]/button";
    my $h4 = $driver->find_element($give_feedback_xpath);
    $h4->click();
    for(my $i=1;$i<=16;$i++)
    {
      if($option == 6)
      {
        $choice = int(rand(5) + 1);
      }
      else
      {
        $choice = $option;
      }
     my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[1]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
     my $h5 = $driver->find_element($dot_xpath);
     $h5->click();
    }
    my $h6 = $driver->find_element($feedback_submit_btn_xpath);
    $h6->click();
  }
 else
 {
      if($option == 6)
      {
        $choice = int(rand(5) + 1);
      }
      else
      {
        $choice = $option;
      }
    my $give_feedback_xpath ="/html/body/div[1]/div/div[2]/div[2]/div/div[2]/div/div/table/tbody/tr[$j]/td[6]/button";
    my $h4 = $driver->find_element($give_feedback_xpath);
    $h4->click();
    for(my $k=1;$k<=9;$k++)
  {
    if($k==1)
    {
      for(my $i=1;$i<=3;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
    elsif($k==2)
    {
      for(my $i=1;$i<=2;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
    elsif($k==3)
    {
      for(my $i=1;$i<=4;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
    elsif($k==4)
    {
      for(my $i=1;$i<=2;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
    elsif($k==5)
    {
      for(my $i=1;$i<=3;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
    elsif($k==6)
    {
      for(my $i=1;$i<=4;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        if($i==2)
        {
          my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[6]/div/div/div/div/div/div[2]/div/div[2]/span[2]/label/span";
          my $h5 = $driver->find_element($dot_xpath);
          $h5->click();
        }
        else
        {
          my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
          my $h5 = $driver->find_element($dot_xpath);
          $h5->click();
        }
      }
    }
    elsif($k==7)
    {
      for(my $i=1;$i<=3;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
    elsif($k==9)
    {
      for(my $i=1;$i<=14;$i++)
      {
        if($option == 6)
        {
          $choice = int(rand(5) + 1);
        }
        else
        {
          $choice = $option;
        }
        my $dot_xpath="/html/body/div[1]/div/div[2]/div[2]/form/div/div[2]/div/div/div[$k]/div/div/div/div/div/div[$i]/div/div[2]/span[$choice]/label/span";
        my $h5 = $driver->find_element($dot_xpath);
        $h5->click();
      }
    }
  }
    my $h6 = $driver->find_element($feedback_submit_btn_xpath);
    $h6->click();
  }
}
# ------------------------------------------------------------------
print color("green"),"----> ANNOYING FEEDBACK IS SUBMITTED SUCCESSFULLY ENJOY :) \n",color("reset");

<>;
$driver->quit();
exit;
