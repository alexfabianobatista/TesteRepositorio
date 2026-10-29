unit Registro0000;

interface

uses Arquivo, Controls, Registro;

type
  TFiscal0000 = Class (TRegistro)
    private
    public
      COD_VER: Integer; //N(3)
      COD_FIN: Integer; //N(1)
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)
      NOME: String; //C
      CNPJ: String; //N(14)
      CPF: String; //N(11)
      UF: String; //C(2)
      IE: String; //C
      COD_MUN: Integer; //N(7)
      IM: String; //C
      SUFRAMA: String; //C(9)
      IND_PERFIL: String; //C(1)
      IND_ATIV: Integer; //N(1)

      procedure grava;
    end;

  TContabil0000 = Class (TRegistro)
    private
    public
      LECD: String; //C(4)
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)
      NOME: String; //C
      CNPJ: String; //N(14)
      UF: String; //C(2)
      IE: String; //C
      COD_MUN: Integer; //N(7)
      IM: String; //C
      IND_SIT_ESP: String; //N(1)
      IND_SIT_INI_PER: Integer; //N(1)
      IND_NIRE: Integer; //N(1)
      IND_FIN_ESC: Integer; //N(1)
      COD_HASH_SUB: String; //C(40)
      IND_GRANDE_PORTE: Integer; //N(1)
      TIP_ECD: Integer; //N(1)
      COD_SCP: String; //N(14)
      IDENT_MF: string; //C(1)
      IND_ESC_CONS: string; //C(1)
      IND_CENTRALIZADA: string; //C(1)
      IND_MUDANC_PC: string; //C(1)
      COD_PLAN_REF: string; //C(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0000 }

procedure TFiscal0000.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_VER, 3);
  addCampo(COD_FIN, 1);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(NOME);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(SomenteNumeros(CPF), 11);
  addCampo(UF, 2);
  addCampo(SomenteNumeros(IE));
  addCampo(COD_MUN, 7);
  addCampo(IM);
  addCampo(SUFRAMA, 9);
  addCampo(IND_PERFIL, 1);
  addCampo(IND_ATIV, 1);


  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

procedure TContabil0000.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(LECD, 4);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(NOME);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(UF, 2);
  addCampo(SomenteNumeros(IE));
  addCampo(COD_MUN, 7);
  addCampo(IM);
  addCampo(IND_SIT_ESP, 1);
  addCampo(IND_SIT_INI_PER, 1);
  addCampo(IND_NIRE, 1);
  addCampo(IND_FIN_ESC, 1);
  addCampo(COD_HASH_SUB);
  addCampo(IND_GRANDE_PORTE, 1);
  addCampo(TIP_ECD, 1);
  addCampo(COD_SCP);
  addCampo(IDENT_MF, 1);
  addCampo(IND_ESC_CONS, 1);
  addCampo(IND_CENTRALIZADA, 1);
  addCampo(IND_MUDANC_PC, 1);
  addCampo(COD_PLAN_REF, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
