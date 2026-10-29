unit ULiberarBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, variants, UFmFilial;

type
  TFLiberaBaixa = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    MEDataInicial: TMaskEdit;
    MEDataFinal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBProcura: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    CBAceite: TCheckBox;
    FmFilial: TFmFilial;
    SpeedButton2: TSpeedButton;
    RgOrdem: TRadioGroup;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBProcuraClick(Sender: TObject);
    procedure CBAceiteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaBaixa: TFLiberaBaixa;

implementation

uses UContasPagar_cl, UUsuario_cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFLiberaBaixa.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
{  If Key=#13 then
    Begin
      DMCOntasPagar.QLiberarBaixa.Edit;
      If DMCOntasPagar.QLiberarBaixaIND_ACEITE.Value='NAO' then
        DMCOntasPagar.QLiberarBaixaIND_ACEITE.Value:='SIM'
      Else
        DMCOntasPagar.QLiberarBaixaIND_ACEITE.Value:='NAO';
      DMCOntasPagar.QLiberarBaixa.Post;
    End;}
end;

procedure TFLiberaBaixa.SpeedButton1Click(Sender: TObject);
var
  exec : TExecutador;
begin
  {
    Comentado por Gian 11/10/2017. Estava alterando o Dsprimario para modo de edição ou inserção, e não conseguia fechar o Form
    Usado executador para atualizar o campo IND_LIBERA

  DMCOntasPagar.QLiberarBaixa.Edit;
  If DMContasPagar.QLiberarBaixaIND_ACEITE.Value='NAO' then
   Begin
    DMContasPagar.QLiberarBaixaIND_ACEITE.Value:='SIM';
    DMContasPagar.QLiberarBaixaDT_ACEITE.Value:=Date;
    DMContasPagar.QLiberarBaixaCOD_USUARIO_ACEITE.Value:=DmUsuario.CodUsuarioCorrente;
   End
  Else
    DMContasPagar.QLiberarBaixaIND_ACEITE.Value:='NAO';
  DMCOntasPagar.QLiberarBaixa.Post;
  }
  with DMContasPagar do
  begin
    exec := TExecutador.Create;
    exec.Adiciona('UPDATE TB_CONTA_PAGAR_CAB SET IND_ACEITE='
    + QuotedStr('SIM') +
    ' WHERE COD_CONTA_PAGAR_CAB = '
      + QLiberarBaixaCOD_CONTA_PAGAR_CAB.Text);
    exec.Executar(True, True);
    QLiberarBaixa.Close;
    QLiberarBaixa.Open;
   end;
end;

procedure TFLiberaBaixa.SBProcuraClick(Sender: TObject);
begin
  With DMContasPagar do
    begin
      QLiberarBaixa.Close;
      If CBAceite.Checked then
        QLiberarBaixa.SetVariable('IND_ACEITE','NAO')
      Else
        QLiberarBaixa.SetVariable('IND_ACEITE',Null);

      If Trim(FmFilial.MeFilial.Text) <> ''  then
        QLiberarBaixa.SetVariable('COD_FILIAL',FmFilial.MeFilial.Text)
      Else
        QLiberarBaixa.SetVariable('COD_FILIAL',Null);

      if Trim(MEDataInicial.Text) = '' then
         Raise Exception.Create('Campo Data Vencimento Inicial Deve Ser Informado');
      QLiberarBaixa.SetVariable('DATA_INICIAL',StrToDate(MEDataInicial.Text));

      if Trim(MEDataFinal.Text) = '' then
         Raise Exception.Create('Campo Data Vencimento Final Deve Ser Informado');

      QLiberarBaixa.SetVariable('DATA_FINAL',StrToDate(MEDataFinal.Text));
      QLiberarBaixa.Sql[QLiberarBaixa.Sql.Count - 1] := '';
      Case RgOrdem.ItemIndex of
        0: QLiberarBaixa.Sql.Add(' Order By COD_CADASTRO');
        1: QLiberarBaixa.Sql.Add(' Order By DT_EMISSAO');
        2: QLiberarBaixa.Sql.Add(' Order By DT_VENCIMENTO');
      end;
      QLiberarBaixa.Open;
    end;
end;

procedure TFLiberaBaixa.CBAceiteClick(Sender: TObject);
begin
  SBProcura.Click;
end;

procedure TFLiberaBaixa.FormActivate(Sender: TObject);
begin
     MeDataInicial.Text := DateToStr(Date() - 5);
     MeDataFinal.Text := DateToStr(Date());
     If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'RADIO') Then
        RgOrdem.ItemIndex := 2;
end;

procedure TFLiberaBaixa.SpeedButton2Click(Sender: TObject);
var
  exec : TExecutador;
begin
  with DMContasPagar do
  begin
    exec := TExecutador.Create;
    exec.Adiciona('UPDATE TB_CONTA_PAGAR_CAB SET IND_ACEITE='
    + QuotedStr('NAO') +
    ' WHERE COD_CONTA_PAGAR_CAB = '
      + QLiberarBaixaCOD_CONTA_PAGAR_CAB.Text);
    exec.Executar(True, True);
    QLiberarBaixa.Close;
    QLiberarBaixa.Open;
   end;
end;

end.
