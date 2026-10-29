unit RegistroD695;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD695 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      SER: String; //C
      NRO_ORD_INI: Integer; //N
      NRO_ORD_FIN: Integer; //N
      DT_DOC_INI: TDate; //N(8)
      DT_DOC_FIN: TDate; //N(8)
      NOM_MEST: String; //C(15)
      CHV_COD_DIG: String; //C(32)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD695 }

procedure TRegistroD695.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(NRO_ORD_INI, 0);
  addCampo(NRO_ORD_FIN, 0);
  addCampo(DT_DOC_INI, 'D');
  addCampo(DT_DOC_FIN, 'D');
  addCampo(NOM_MEST, 15);
  addCampo(CHV_COD_DIG, 32);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
