unit UNCMMargemClasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmSubClasse, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, UFmMarca;

type
  TFNCMMargemClasse = class(TFTCadSimples)
    FmSubClasse: TFmSubClasse;
    Label1: TLabel;
    MeNcm: TMaskEdit;
    BtNcm: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    MeAtacado: TMaskEdit;
    MeVarejo: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Fm1Marca: TFmMarca;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtNcmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNCMMargemClasse: TFNCMMargemClasse;

implementation

uses UOracle_cl, UNcmCons, UNcm_cl;

{$R *.dfm}

procedure TFNCMMargemClasse.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(FmSubClasse.MeClasse.Text) = '' Then
     Raise exception.Create('Informar Código da Classe');
  If (Trim(MeNcm.Text) = '')     And
     (Trim(MeAtacado.Text) = '') And
     (Trim(MeVarejo.Text) = '')  Then
     Raise Exception.Create('Informar Ncm, Margem Atacado ou Margem Varejo');
  try
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    If Trim(MeNcm.Text) <> '' Then
     Begin
       DMOracle.QExecSQL.SQL.Add('UPDATE TB_PRODUTO SET NUM_GENERO_NCM = ' + QuotedStr(MeNcm.Text));
       If Trim(MeAtacado.Text) <> '' Then
          DMOracle.QExecSQL.SQL.Add(', PERC_MARGEM_ATACADO = ' + Trim(MeAtacado.Text));
       If Trim(MeVarejo.Text) <> '' Then
          DMOracle.QExecSQL.SQL.Add(', PERC_MARGEM_VAREJO = ' + Trim(MeVarejo.Text));
     End
    Else
       If Trim(MeAtacado.Text) <> '' Then
        Begin
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_PRODUTO SET PERC_MARGEM_ATACADO = ' + Trim(MeAtacado.Text));
          If Trim(MeVarejo.Text) <> '' Then
             DMOracle.QExecSQL.SQL.Add(', PERC_MARGEM_VAREJO = ' + Trim(MeVarejo.Text));
        End
       Else
          DMOracle.QExecSQL.SQL.Add('UPDATE TB_PRODUTO SET PERC_MARGEM_VAREJO = ' + Trim(MeVarejo.Text));
    DMOracle.QExecSQL.SQL.Add(' WHERE COD_CLASSE IN (SELECT COD_CLASSE FROM TB_CLASSE WHERE NUM_CLASSE =  ' + Trim(FmSubClasse.MeClasse.Text));
    //adicionado filtro por MARCA. Solicitação do DIEGO da JR MULTIPECAS. Junior - 30/01/2015
    If (Trim(FmSubClasse.MeSubClasse.Text) <> '') and (Trim(Fm1Marca.MeMarca.Text) <> '') Then
       DMOracle.QExecSQL.SQL.Add(' AND NUM_SUBCLASSE = ' + Trim(FmSubClasse.MeSubClasse.Text) +
                                 ' AND COD_MARCA = ' + Trim(Fm1Marca.MeMarca.Text) + ')')
    else
    if (Trim(FmSubClasse.MeSubClasse.Text) <> '') and (Trim(Fm1Marca.MeMarca.Text) = '')  Then
      DMOracle.QExecSQL.SQL.Add(' AND NUM_SUBCLASSE = ' + Trim(FmSubClasse.MeSubClasse.Text) + ')')
    Else
       DMOracle.QExecSQL.SQL.Add(')');

    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise Exception.Create('Não atualizou cadastro de produtos');
  End;
end;

procedure TFNCMMargemClasse.BtNcmClick(Sender: TObject);
begin
  inherited;
  If FNcmCons = Nil Then
     FNcmCons := TFNcmCons.Create(Application);
  If FNcmCons.ShowModal = MrOk Then
     MeNcm.Text := DMNcm.QNcmConsCod_Ncm.Text;   
end;

end.
