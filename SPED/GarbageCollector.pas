unit GarbageCollector;

interface

type
  ISafeGuard = type IUnknown;

// Use the Guard function to instantiate the object!
function Guard(Obj : TObject; out SafeGuard : ISafeGuard) : TObject;

implementation

type
  TSafeGuard = class(TInterfacedObject, ISafeGuard)
  private
    FObj : TObject;
  public
    constructor Create(Obj : TObject);
    destructor Destroy; override;
  end;

constructor TSafeGuard.Create(Obj : TObject);
begin
  FObj := Obj;
end;

destructor TSafeGuard.Destroy;
begin
  if Assigned(FObj) then
  begin
    FObj.Free;
    FObj := nil;
  end;
  inherited Destroy;
end;

function Guard(Obj : TObject; out SafeGuard : ISafeGuard) : TObject;
begin
  Result := Obj;
  SafeGuard := TSafeGuard.Create(Obj);  // Create the proxy obj.
end;

end.
