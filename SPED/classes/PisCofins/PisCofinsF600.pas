unit PisCofinsF600;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF600 = class(TRegistro)
  private
  public
    IND_NAT_RET: Integer; //N(2)
    DT_RET: TDate; //N(8)
    VL_BC_RET: Double; //N(X,4)
    VL_RET: Double; //N(X,2)
    COD_REC: string; //C(4)
    IND_NAT_REC: Integer; //N(1)
    CNPJ: string; //N(14)
    VL_RET_PIS: Double; //N(X,2)
    VL_RET_COFINS: Double; //N(X,2)
    IND_DEC: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF600.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_NAT_RET, 2);
  addCampo(DT_RET, 'D');
  addCampo(VL_BC_RET, 2);
  addCampo(VL_RET, 2);
  addCampo(COD_REC, 4);
  addCampo(IND_NAT_REC, 1);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(VL_RET_PIS, 2);
  addCampo(VL_RET_COFINS, 2);
  addCampo(IND_DEC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
