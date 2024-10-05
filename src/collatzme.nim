proc collatz_seq(startNumber: int): seq[int] = 
  var n = startNumber
  var seq = @[n]

  while n > 1:
    if n mod 2 != 0:
      n = n * 3 + 1
    else:
      n = n div 2
    seq.add(n)
  return seq

proc highest_len*(b_range: int, e_range: int): (int, int) = 
  var max_len = 0
  var max_num = 0

  for i in b_range..e_range:
    let seq_len = collatz_seq(i).len
    if seq_len > max_len:
      max_len = seq_len
      max_num = i
      echo "Current maximum number is : ", max_num
      echo "Current maximum length is : ", max_len

  return (max_num, max_len)

let (number, length) = highest_len(1, 1000)

echo "The number with the highest Collatz sequence between 1 and 1000 is : ", number
echo "The length of the sequence is : ", length
