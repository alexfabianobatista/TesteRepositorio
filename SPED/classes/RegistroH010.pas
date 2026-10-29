unit RegistroH010;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroH010 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //C
      UNID: String; //C
      QTD: Double; //N(X,3)
      VL_UNIT: Double; //N(X,6)
      VL_ITEM: Double; //N(X,2)
      IND_PROP: String; //C(1)
      COD_PART: String; //C
      TXT_COMPL: String; //C
      COD_CTA: String; //C
      VL_ITEM_IR: Double; //N(X,2)

      procedure grava(pData: TDateTime); Overload;
    end;

implementation

uses UFuncoes, SysUtils;

{ TRegistroH010 }

procedure TRegistroH010.grava(pData: TDateTime);
begin
  //inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(UNID);
  addCampo(QTD, 3);
  addCampo(VL_UNIT, 6);
  addCampo(VL_ITEM, 2);
  addCampo(IND_PROP, 1);
  addCampo(COD_PART);
  addCampo(TXT_COMPL);
  addCampo(COD_CTA);
  if pData > StrToDate('31/12/2014') then
    addCampo(VL_ITEM_IR, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
