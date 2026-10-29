unit UCodEstadoIBGE;

interface

  uses
    Classes, Variants;

  type
    TCodEstadoIBGE = Class
  private
  protected
  public
    function getCodIbge(uf :String) :String;
  end;
var
  CodEstadoIBGE: TCodEstadoIBGE;
  
implementation

  function TCodEstadoIBGE.getCodIbge(uf :String) :String;
  begin
    if uf = 'PARANÁ' then
      result := '41';
    if uf = 'SÃO PAULO' then
      result := '35';
    if uf = 'MATO GROSSO DO SUL' then
      result := '50';      
  end;
end.
