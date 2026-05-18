

abstract class MethodListenInterface{
  listenMethodName();
  invokeMethodCall(String key, dynamic arguments);
}

class MethodListen{
  static final MethodListen _instance = MethodListen();
  static MethodListen shareInstance(){
    return _instance;
  }
  List<MethodListenInterface>listeners = <MethodListenInterface>[];
  appendMethodCallListener(Object obj){
    if(obj is MethodListenInterface && !listeners.contains(obj)){
      listeners.add(obj);
    }
  }
  postMethod(String key,var arguments){
    for(MethodListenInterface obj in _instance.listeners){
      if(obj.listenMethodName() is List){
        List names = obj.listenMethodName();
        if(names.contains(key)){
          obj.invokeMethodCall(key,arguments);
        }
      }
    }
  }
  removeAllMethodListener(){
    _instance.listeners.clear();
  }
  removeMethodListener(Object obj){
    _instance.listeners.remove(obj);
  }
}
