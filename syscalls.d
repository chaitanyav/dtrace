
syscall::read:entry /pid == $1/{
  @reads[execname] = count();
  @read_bytes[execname] = sum(arg2);

}

syscall::write:entry /pid == $1/ {
  @writes[execname] = count();
  @write_bytes[execname] = sum(arg2);
}

END {
    printf("%15s\t\t%15s\n", "EXECNAME", "NUM READ SYSCALLS");
    printf("---------------\t\t---------------\n");
    printa("%15s\t\t%@d\n", @reads);
    printf("\n\n");
    printf("%15s\t\t%15s\n", "EXECNAME", "NUM WRITE SYSCALLS");
    printf("---------------\t\t---------------\n");
    printa("%15s\t\t%@d\n", @writes);
    printf("\n\n");
    printf("%15s\t\t%15s\n", "EXECNAME", "NUM READ BYTES");
    printf("---------------\t\t---------------\n");
    printa("%15s\t\t%@d\n", @read_bytes);
    printf("\n\n");
    printf("%15s\t\t%15s\n", "EXECNAME", "NUM WRITE BYTES");
    printf("---------------\t\t---------------\n");
    printa("%15s\t\t%@d\n", @write_bytes);
}
