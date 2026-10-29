unit RegistroH020;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroH020 = Class (TRegistro)
    private
    public
      CST_ICMS: String; //C
      BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      procedure grava(pData: TDateTime); Overload;
    end;

implementation

uses UFuncoes, SysUtils;

{ TRegistroH020 }

procedure TRegistroH020.grava(pData: TDateTime);
begin
  //inherited;

  addCampo(bloco + registro);
  addCampo(CST_ICMS);
  addCampo(BC_ICMS, 2);
  addCampo(VL_ICMS, 2);  

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
