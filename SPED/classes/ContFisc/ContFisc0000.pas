unit ContFisc0000;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0000 = Class (TRegistro)
    private
    public

      NOME_ESC: String; //C(4)
      COD_VER: Integer; //C(4)
      CNPJ: String; //C(14)
      NOME: String; //C
      IND_SIT_INI_PER: Integer; //N(1)
      SIT_ESPECIAL: Integer;//C(1)
      PAT_REMAN_CIS: string; //N(5)
      DT_SIT_ESP: string; //N(8)
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)
      RETIFICADORA: String; //C(1)
      NUM_REC: String; //C(41)
      TIP_ECF: Integer; //N(1)
      COD_SCP: String; //N(14)

      procedure grava;

    end;


implementation

uses UFuncoes;

procedure TContFisc0000.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NOME_ESC, 4);
  addCampo(COD_VER, 4);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(NOME);
  addCampo(IND_SIT_INI_PER, 1);
  addCampo(SIT_ESPECIAL, 1);
  addCampo(PAT_REMAN_CIS);
  addCampo(DT_SIT_ESP);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(RETIFICADORA, 1);
  addCampo(NUM_REC, 41);
  addCampo(TIP_ECF, 1);
  addCampo(COD_SCP, 14);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
