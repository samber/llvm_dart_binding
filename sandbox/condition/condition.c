

int	condition(int a, int b) {
  if (a == 42)
    return a;
  return b;
}

int	main(int ac, char **av) {
  return condition(42, 21);
}
