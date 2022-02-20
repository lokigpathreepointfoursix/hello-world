grep "/products/" $1 | cut -d "	" -f 1,4 | sort | uniq
