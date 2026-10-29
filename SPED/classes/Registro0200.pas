unit Registro0200;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TRegistro0200 = Class (TRegistro)
    private
      wDataArquivo: tdate;
    public
      COD_ITEM: String; //C
      DESCR_ITEM: String; //C
      COD_BARRA: String; //C
      COD_ANT_ITEM: String; //C
      UNID_INV: String; //C
      TIPO_ITEM: Integer; //N(2)
      COD_NCM: String; //C(8)
      EX_IPI: String; //C(3)
      COD_GEN: Integer; //N(2)
      COD_LST: String; //C(CC.CC)
      ALIQ_ICMS: Double; //N(X,2)
      COD_CEST: String; //C(7)
      property pDataArquivo: tdate read wDataArquivo write wDataArquivo;
      procedure grava;
    end;

implementation

uses UFuncoes, UBiblioteca;

{ TRegistro0200 }

procedure TRegistro0200.grava;
var aux: String;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(DESCR_ITEM);
  addCampo(COD_BARRA);
  addCampo(COD_ANT_ITEM);
  addCampo(UNID_INV);
  addCampo(TIPO_ITEM, 2);
  addCampo(COD_NCM, 8);
  addCampo(EX_IPI, 3);
  addCampo(COD_GEN, 2);
  if COD_LST = '' then
    addCampo('')
  else
  begin
    aux := Bib.StrZero(COD_LST,4);
    aux := copy(aux,0,2)+'.'+copy(aux,3,2);
    addCampo(aux,5);
  end;
  addCampo(ALIQ_ICMS, 2);

  // Mudou o layout
  if pDataArquivo >= strToDate('01/01/2017') then
    addCampo(COD_CEST, 7);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
