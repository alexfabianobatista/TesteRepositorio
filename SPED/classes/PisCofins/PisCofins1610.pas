unit PisCofins1610;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1610 = class(TRegistro)
  private
  public
    CNPJ: string; //N(14)
    CST_COFINS: Integer; //N(2)
    COD_PART: string; //C(60)
    DT_OPER: TDate; //N(8)
    VL_OPER: Double; //N(X,2)
    VL_BC_COFINS: Double; //N(X,3)
    ALIQ_COFINS: Double; //N(X,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)
    DESC_COMPL: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1610 }

procedure TPisCofins1610.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(CST_COFINS, 2);
  addCampo(COD_PART, 60);
  addCampo(DT_OPER, 'D');
  addCampo(VL_OPER, 2);
  addCampo(VL_BC_COFINS, 3);
  addCampo(ALIQ_COFINS, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);
  addCampo(DESC_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
