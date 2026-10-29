unit RegistroC165;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC165 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      VEIC_ID: String; //C
      COD_AUT: String; //C
      NR_PASSE: String; //C
      HORA: TTime; //N(6)
      TEMPER: Double; //N(X,1)
      QTD_VOL: Integer; //N
      PESO_BRT: Double; //N(X,2)
      PESO_LIQ: Double; //N(X,2)
      NOM_MOT: String; //C
      CPF: String; //N(11)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC165 }

procedure TRegistroC165.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(VEIC_ID);
  addCampo(COD_AUT);
  addCampo(NR_PASSE);
  addCampo(HORA, 'H');
  addCampo(TEMPER, 1);
  addCampo(QTD_VOL, 1);
  addCampo(PESO_BRT, 2);
  addCampo(PESO_LIQ, 2);
  addCampo(NOM_MOT);
  addCampo(CPF, 11);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
