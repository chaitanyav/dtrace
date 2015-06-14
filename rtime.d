syscall::read:entry, syscall::write:entry {
  self->t = timestamp;
}

syscall::read:return, syscall::write:return /self->t != 0/ {
  printf("%s %d/%d spent %d nsecs in %s(2)\n", execname, pid, tid, timestamp - self->t, probefunc);
  self->t = 0;
}
