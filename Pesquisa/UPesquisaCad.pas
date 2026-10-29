unit UPesquisaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, QuickRpt, Qrctrls, DBDirceu, variants;

type
  TFPesquisaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    QRShape1: TQRShape;
    Label18: TLabel;
    Label19: TLabel;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    Label20: TLabel;
    DBMemo1: TDBMemo;
    QRShape2: TQRShape;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBMemo2: TDBMemo;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup13: TDBRadioGroup;
    DBRadioGroup14: TDBRadioGroup;
    DBMemo3: TDBMemo;
    DBEdit21: TDBEdit;
    Label28: TLabel;
    DBEdit22: TDBEdit;
    Label27: TLabel;
    SBCadastro: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    DBMemo9: TDBMemo;
    DBMemo10: TDBMemo;
    DBMemo11: TDBMemo;
    DBMemo12: TDBMemo;
    DBMemo13: TDBMemo;
    DBMemo14: TDBMemo;
    DBMemo15: TDBMemo;
    DBMemo16: TDBMemo;
    DBEdit1: TDBEdit;
    Label29: TLabel;
    RepresentantesAtivos1: TMenuItem;
    RepresentantesInativos1: TMenuItem;
    DBRadioGroup15: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit21Change(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RepresentantesAtivos1Click(Sender: TObject);
    procedure RepresentantesInativos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaCad: TFPesquisaCad;

implementation

uses UPesquisa_cl, UCadastroCons, UCadastro_cl, UOracle_cl, UPesquisaCons,
  UPesquisaParam, URPesquisa, URPesquisaInativo;

{$R *.DFM}

procedure TFPesquisaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPesquisa.QPesquisa.open;
end;

procedure TFPesquisaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DMPesquisa.Qpesquisa.Close;
   Action := CaFree;
  FPesquisaCad := Nil;
end;

procedure TFPesquisaCad.Sair1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFPesquisaCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMPesquisa.QpesquisaCOD_CADASTRO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFPesquisaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit,DsInsert] then
    SBCadastro.Enabled:=True
  else
    SBCadastro.Enabled:=False;
end;

procedure TFPesquisaCad.DBEdit21Change(Sender: TObject);
begin
  inherited;
  DMPesquisa.QPesquisaDT_PESQUISA.Value := DMOracle.DataServ;
end;

procedure TFPesquisaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPesquisaCons = Nil then
    FPesquisaCons := TFPesquisaCons.Create(Application);
  If FPesquisaCons.ShowModal = mrOk then
  With DMPesquisa do
  Begin
    QPesquisa.Close;
    QPesquisa.SetVariable('PK',QPesquisaConsCod_Pesquisa.Value);
    QPesquisa.Open;
  end;  
end;

procedure TFPesquisaCad.RepresentantesAtivos1Click(Sender: TObject);
begin
  inherited;
  If FPesquisaParam = Nil then
    FPesquisaParam := TFPesquisaParam.Create(Application);
  FPesquisaParam.PGRelatorio.Pages[0].TabVisible := True;
  If FPesquisaParam.ShowModal = mrOk then
  With DMPesquisa do
  Begin
    QRPesquisaAtivo.Close;
    QRTotalAtivo.Close;
    If FPesquisaParam.ME1Dt_inicial.Text = '' then
      Raise Exception.Create('É necessário preencher as datas !');
      QRPesquisaAtivo.SetVariable('DT_INICIAL',FPesquisaParam.ME1DT_INICIAL.Text);
      QRPesquisaAtivo.SetVariable('DT_FINAL',FPesquisaParam.ME1DT_FINAL.Text);
      QRTotalAtivo.SetVariable('DT_INICIAL',FPesquisaParam.ME1DT_INICIAL.Text);
      QRTotalAtivo.SetVariable('DT_FINAL',FPesquisaParam.ME1DT_FINAL.Text);

    If FPesquisaParam.ME1Cadastro.Text = '      ' then
    Begin
      QRPesquisaAtivo.setVariable('CADASTRO',NULL);
      QRTotalAtivo.setVariable('CADASTRO',NULL);
    end
    Else
    Begin
      QRPesquisaAtivo.setVariable('CADASTRO',FPesquisaParam.ME1Cadastro.Text);
      QRTotalAtivo.setVariable('CADASTRO',FPesquisaParam.ME1Cadastro.Text);
    end;  

      QRPesquisaAtivo.Open;
      QRTotalAtivo.open;
    If FRPesquisaAtivos = Nil then
      FRPesquisaAtivos := TFRPesquisaAtivos.Create(Application);
    FRPesquisaAtivos.QRLPeriodo.Caption := 'Período : '+ FPesquisaParam.ME1DT_INICIAL.Text+' até '+FPesquisaParam.ME1DT_FINAL.Text;
    If FPesquisaParam.RGPreview.ItemIndex = 0 then
      FRPesquisaAtivos.QRPrimario.Preview
    Else
      FRPesquisaAtivos.QRPrimario.Print;
    QRPesquisaAtivo.Close;
    QRTotalAtivo.Close;
  End;

end;

procedure TFPesquisaCad.RepresentantesInativos1Click(Sender: TObject);
begin
  inherited;
  If FPesquisaParam = Nil then
    FPesquisaParam := TFPesquisaParam.Create(Application);
  FPesquisaParam.PGRelatorio.Pages[0].TabVisible := True;
  If FPesquisaParam.ShowModal = mrOk then
  With DMPesquisa do
  Begin
    QRPesquisaInativo.Close;
    QRTotalInativo.Close;
    If FPesquisaParam.ME1Dt_inicial.Text = '' then
    Raise Exception.Create('É necessário preencher as datas !');
      QRPesquisaInativo.SetVariable('DT_INICIAL',FPesquisaParam.ME1DT_INICIAL.Text);
      QRPesquisaInativo.SetVariable('DT_FINAL',FPesquisaParam.ME1DT_FINAL.Text);
      QRTotalInativo.SetVariable('DT_INICIAL',FPesquisaParam.ME1DT_INICIAL.Text);
      QRTotalInativo.SetVariable('DT_FINAL',FPesquisaParam.ME1DT_FINAL.Text);

    If FPesquisaParam.ME1Cadastro.Text = '      ' then
    Begin
      QRPesquisaInativo.SetVariable('CADASTRO',NULL);
      QRTotalInativo.SetVariable('CADASTRO',NULL);
    end
    Else
    Begin
      QRPesquisaInativo.SetVariable('CADASTRO',FPesquisaParam.ME1Cadastro.Text);
      QRTotalInativo.SetVariable('CADASTRO',FPesquisaParam.ME1Cadastro.Text);
    end;

      QRPesquisaInativo.Open;
      QRTotalInativo.open;
    If FRPesquisaInativo = Nil then
      FRPesquisaInativo := TFRPesquisaInativo.Create(Application);
    FRPesquisaInativo.QRLPeriodo.Caption := 'Período : '+ FPesquisaParam.ME1DT_INICIAL.Text+' até '+FPesquisaParam.ME1DT_FINAL.Text;
    If FPesquisaParam.RGPreview.ItemIndex = 0 then
      FRPesquisaInativo.QRPrimario.Preview
    Else
      FRPesquisaInativo.QRPrimario.Print;
    QRPesquisaInativo.Close;
    QRTotalInativo.Close;
  End;

end;

end.
