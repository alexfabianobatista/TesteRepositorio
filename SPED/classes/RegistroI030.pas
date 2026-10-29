unit RegistroI030;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TRegistroI030 = Class (TRegistro)
    private
    public
      DNRC_ABERT: String; //C(17)
      NUM_ORD: Integer; //N
      NAT_LIVR: String; //C(80)
      QTD_LIN: Integer; //N
      NOME: String; //C
      NIRE: String; //N(11)
      CNPJ: String; //N(14)
      DT_ARQ: TDate; //N(8)
      DT_ARQ_CONV: TDate; //N(8)
      DESC_MUN: String; //C
      DT_EX_SOCIAL: TDate; //N(8)
      NOME_AUDITOR: String; //C
      COD_CVM_AUDITOR: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI030 }

procedure TRegistroI030.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DNRC_ABERT, 17);
  addCampo(NUM_ORD, 0);
  addCampo(NAT_LIVR, 80);
  addCampo(QTD_LIN, 0);
  addCampo(NOME);
  addCampo(NIRE, 11);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(DT_ARQ, 'D');
  addCampo(DT_ARQ_CONV, 'D');
  addCampo(DESC_MUN);
  addCampo(DT_EX_SOCIAL, 'D');
  if Trim(NOME_AUDITOR) <> '' then
    addCampo(NOME_AUDITOR);
  if Trim(COD_CVM_AUDITOR) <> '' then
    addCampo(COD_CVM_AUDITOR);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
