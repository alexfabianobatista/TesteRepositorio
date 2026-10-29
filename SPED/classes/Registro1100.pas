unit Registro1100;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1100 = Class (TRegistro)
    private
    public
      IND_DOC: Integer; //N(1)
      NRO_DE: String; //N(11)
      DT_DE: TDate; //N(8)
      NAT_EXP: Integer; //N(1)
      NRO_RE: String; //N(12)
      DT_RE: TDate; //N(8)
      CHC_EMB: String; //C(16)
      DT_CHC: TDate; //N(8)
      DT_AVB: TDate; //N(8)
      TP_CHC: Integer; //N(2)
      PAIS: Integer; //N(3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1100 }

procedure TRegistro1100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DOC, 1);
  addCampo(SomenteNumeros(NRO_DE), 11);
  addCampo(DT_DE, 'D');
  addCampo(NAT_EXP, 1);
  addCampo(SomenteNumeros(NRO_RE), 12);
  addCampo(DT_RE, 'D');
  addCampo(CHC_EMB, 16);
  addCampo(DT_CHC, 'D');
  addCampo(DT_AVB, 'D');
  addCampo(TP_CHC, 2);
  addCampo(PAIS, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
