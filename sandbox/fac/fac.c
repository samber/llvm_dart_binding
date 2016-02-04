

int	fac(int a) {
  if (a > 1)
    return fac(a - 1) * a;
  return 1;
}

int	main(int ac, char **av) {
  return fac(3);
}
