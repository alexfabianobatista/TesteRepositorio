unit PisCofins1210;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1210 = class(TRegistro)
  private
  public
    CNPJ: string; //N(14)
    CST_PIS: Integer; //N(2)
    COD_PART: string; //C(60)
    DT_OPER: TDate; //N(8)
    VL_OPER: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,3)
    ALIQ_PIS: Double; //N(X,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)
    DESC_COMPL: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1210 }

procedure TPisCofins1210.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(CST_PIS, 2);
  addCampo(COD_PART, 60);
  addCampo(DT_OPER, 'D');
  addCampo(VL_OPER, 2);
  addCampo(VL_BC_PIS, 3);
  addCampo(ALIQ_PIS, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);
  addCampo(DESC_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
