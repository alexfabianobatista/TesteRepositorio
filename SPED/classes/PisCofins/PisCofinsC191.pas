unit PisCofinsC191;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC191 = class(TRegistro)
  private
  public
    CNPJ_CPF_PART: string; //N(14)
    CST_PIS: Integer; //N(2)
    CFOP: Integer; //N(4)
    VL_ITEM: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(3,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC191 }

procedure TPisCofinsC191.grava;
begin
  inherited;

  addCampo(bloco + registro);
  if Length(SomenteNumeros(CNPJ_CPF_PART)) > 11 then
    addCampo(SomenteNumeros(CNPJ_CPF_PART), 14)
  else
    addCampo(SomenteNumeros(CNPJ_CPF_PART), 11);
  addCampo(CST_PIS, 2);
  addCampo(CFOP, 4);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(QUANT_BC_PIS, 3);
  addCampo(ALIQ_PIS_QUANT, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
