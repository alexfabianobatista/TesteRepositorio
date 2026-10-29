unit PisCofinsM630;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM630 = class(TRegistro)
  private
  public
    CNPJ: string; //N(14)
    VL_VEND: Double; //N(X,2)
    VL_NAO_RECEB: Double; //N(X,2)
    VL_CONT_DIF: Double; //N(X,2)
    VL_CRED_DIF: Double; //N(X,2)
    COD_CRED: string; //C(3)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM630.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(VL_VEND, 2);
  addCampo(VL_NAO_RECEB, 2);
  addCampo(VL_CONT_DIF, 2);
  addCampo(VL_CRED_DIF, 2);
  addCampo(COD_CRED, 3);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

