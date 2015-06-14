syscall::read:entry, syscall::write:entry /pid == 67525/ {
  printf("Executable Name: %s, Provider: %s, Module: %s, Function: %s, Name: %s\n", execname, probeprov, probemod, probefunc, probename);
}
