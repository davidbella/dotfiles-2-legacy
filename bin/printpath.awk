#! /bin/awk -f

BEGIN  {
       n = split (ENVIRON["PATH"], path, ":")
       for (i = 1; i <= n; ++i)
       print path[i]
}
