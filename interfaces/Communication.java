package interfaces;

public interface Communication<T,K>{
  void post(T info, K code);
}
