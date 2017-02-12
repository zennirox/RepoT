use diagnostics;
use warnings;
use strict;
use File::Find;

my @files;
my $direcory = 'C:\Users\Szymon\Desktop\perl_praca';

# print("Enter type to found: ");
# chomp (my $type_to_find = <STDIN>);
my $type_to_find = ".txt";

find(\&wanted, $direcory );
sub wanted {
  return unless -f;
  return unless /$type_to_find$/;
  push @files, $File::Find::name;
}

 # print("Found files:  \n");
 # print join ("\n", @files);

# my $date = 2012;
# my @old_files;
# foreach my $single_file (@files){
#   open(my $in, '<', $single_file) or die "Can't open file.";
#   open(my $out, '>', $single_file) or die "Can't open file";
#     while (my $row = <$in>) {
#       chomp ($row);
#       if ($row =~ $date) {
#         push @old_files, $single_file;
#         print $out "pierwszy";
#         while (<$in>) {
#           print $out $_;
#         }
#         close $out;
#       }
#     }
#
# }
# print join ("\n",@old_files);
# foreach my $old_single_file (@old_files){
#   open(my $fh, '>>', $old_single_file) or die "Can't open file";
#     print $fh "dopisalem";
#
# }
my $check = 0;
my @file_data;
open (my $in,  '<',  $files[0])      or die "Can't read old file: $!";
while (my $row = <$in>) {
  chomp ($row);
  if ($check == 1){
    push @file_data, "$row \n";
  }
  if ($row =~ /^2012/) {
    push @file_data, "$row \n";
    $check = 1;
  }
}
print @file_data;
if ($check == 1){
  open (my $out, '>', $files[0]) or die "Can't write new file: $!";
  print $out "_P_ \n";
  print $out @file_data;
}


# open (my $out, '>', $files[0]) or die "Can't write new file: $!";
# print $out "pierwzy\n";
#
# while( <$in> ) {
#         print $out $_;
# }
# close $out;
