unit RegistroC700;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC700 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      SER: String; //C
      NRO_ORD_INI: Integer; //N(9)
      NRO_ORD_FIN: Integer; //N(9)
      DT_DOC_INI: TDate; //N(8)
      DT_DOC_FIN: TDate; //N(8)
      NOM_MEST: String; //C(15)
      CHV_COD_DIG: String; //N(32)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC700 }

procedure TRegistroC700.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(NRO_ORD_INI, 9);
  addCampo(NRO_ORD_FIN, 9);
  addCampo(DT_DOC_INI, 'D');
  addCampo(DT_DOC_FIN, 'D');
  addCampo(NOM_MEST, 15);
  addCampo(CHV_COD_DIG, 32);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
