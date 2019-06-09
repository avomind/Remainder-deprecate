package interfaces;

/**
 *
 * @param <I> Information type
 * @param <MC> Mine code type
 * @param <OC> Other code type
*/
public interface Communication<I,MC,OC>{
  /**
   *
   * @param info the Information
   * @param code An action to be executed
   * @param channel Is the emitter Communication<I,OC,MC>
  */
  void post(I info, MC code, Communication<I,OC,MC> channel);
}
