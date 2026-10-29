unit RegistroJ900;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ900 = Class (TRegistro)
    private
    public
      DNRC_ENCER: String; //C(21)
      NUM_ORD: Integer; //N
      NAT_LIVRO: String; //C(80)
      NOME: String; //C
      QTD_LIN: Integer; //N
      DT_INI_ESCR: TDate; //D(8)
      DT_FIN_ESCR: TDate; //D(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ900 }

procedure TRegistroJ900.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DNRC_ENCER, 21);
  addCampo(NUM_ORD, 0);
  addCampo(NAT_LIVRO, 80);
  addCampo(NOME);
  addCampo(QTD_LIN, 0);
  addCampo(DT_INI_ESCR, 'D');
  addCampo(DT_FIN_ESCR, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
