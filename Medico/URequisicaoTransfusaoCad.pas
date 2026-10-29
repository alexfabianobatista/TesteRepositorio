unit URequisicaoTransfusaoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids;

type
  TFRequisicaoTransfusaoCad = class(TFTCadSimples)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup8: TDBRadioGroup;
    Relao1: TMenuItem;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relao1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoTransfusaoCad: TFRequisicaoTransfusaoCad;

implementation

uses UMedico_cl, UCadastroCons, UCadastro_cl, URequisicaoTransfusaoCons,
  URequisicaoTransfusaoParam, URRequisicaoTransfusao, URequisicaoTransfusao_cl,
  UOracle_cl;

{$R *.dfm}

procedure TFRequisicaoTransfusaoCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRequisicaoTransfusao.QRequisicaoTransfusaoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFRequisicaoTransfusaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMRequisicaoTransfusao.QRequisicaoTransfusao;
end;

procedure TFRequisicaoTransfusaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
  DMRequisicaoTransfusao.DSRequisicaoTransfusaoItem.DataSet.Open;
  DBNavigator1.Enabled := False;  
end;

procedure TFRequisicaoTransfusaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FRequisicaoTransfusaoCons = Nil then
    FRequisicaoTransfusaoCons := TFRequisicaoTransfusaoCons.Create(Application);
  if FRequisicaoTransfusaoCons.ShowModal = MrOk then
  begin
    DMRequisicaoTransfusao.QRequisicaoTransfusao.Close;
    DMRequisicaoTransfusao.QRequisicaoTransfusao.SetVariable('PK',DMRequisicaoTransfusao.QRequisicaoTransfusaoConsCOD_REQUISICAO_TRANSFUSAO.Value);
    DMRequisicaoTransfusao.QRequisicaoTransfusao.Open;
    DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.Close;
    DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.SetVariable('COD_REQUISICAO_TRANSFUSAO',DMRequisicaoTransfusao.QRequisicaoTransfusaoConsCOD_REQUISICAO_TRANSFUSAO.Value);
    DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.open;
  end;

end;

procedure TFRequisicaoTransfusaoCad.Relao1Click(Sender: TObject);
begin
  inherited;
  if FRequisicaoTransfusaoParam = Nil then
    FRequisicaoTransfusaoParam:= TFRequisicaoTransfusaoParam.Create(Application);
  FRequisicaoTransfusaoParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FRequisicaoTransfusaoParam.ShowModal =  mrOk then
    begin
      with DMRequisicaoTransfusao do
      begin
        QRRequisicaoTransfusao.Close;
        if Trim(FRequisicaoTransfusaoParam.FMCadastro1.MECadastro.text) <>'' then
          QRRequisicaoTransfusao.SetVariable('PACIENTE',FRequisicaoTransfusaoParam.FMCadastro1.MEcadastro.text)
        else
          QRRequisicaoTransfusao.SetVariable('PACIENTE',Null);

        if Trim(FRequisicaoTransfusaoParam.ME0DtInicial.text) <> '' then
          QRRequisicaoTransfusao.SetVariable('DT_INICIAL',StrToDate(FRequisicaoTransfusaoParam.ME0DtInicial.text))
        else
          QRRequisicaoTransfusao.SetVariable('DT_INICIAL',Null);

        if Trim(FRequisicaoTransfusaoParam.ME0DtFinal.text) <> '' then
          QRRequisicaoTransfusao.SetVariable('DT_FINAL',StrToDate(FRequisicaoTransfusaoParam.ME0DtFinal.text))
        else
          QRRequisicaoTransfusao.SetVariable('DT_FINAL',Null);

        Case FRequisicaoTransfusaoParam.Rg0Tipo.ItemIndex Of
           0: QRRequisicaoTransfusao.SetVariable('TIPO_REQUISICAO',NULL);
           1: QRRequisicaoTransfusao.SetVariable('TIPO_REQUISICAO','EMERGENCIA');
           2: QRRequisicaoTransfusao.SetVariable('TIPO_REQUISICAO','URGENCIA');
           3: QRRequisicaoTransfusao.SetVariable('TIPO_REQUISICAO','ROTINA');
        End;

        QRRequisicaoTransfusao.Open;
        If FRRequisicaoTransfusao = Nil then
          FRRequisicaoTransfusao := TFRRequisicaoTransfusao.Create(Application);
        FRRequisicaoTransfusao.QrlTitulo.Caption := 'Relação de Requisições de Transfusão';
        FRRequisicaoTransfusao.QrlPeriodo.Caption := 'Período de: '+FRequisicaoTransfusaoParam.ME0DtInicial.text+' até '+FRequisicaoTransfusaoParam.ME0DtFinal.text;
        If FRequisicaoTransfusaoParam.RGPreview.ItemIndex = 0 then
          FRRequisicaoTransfusao.QRPrimario.Preview
        else
          FRRequisicaoTransfusao.QRPrimario.Print;
        QRRequisicaoTransfusao.Close;
      end;
    end;

end;

procedure TFRequisicaoTransfusaoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  //If ((DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.State = dsInsert) or
  //    (DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.State = dsEdit)) then
  //  DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.Commitupdates;
  DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.Post;
  DBNavigator1.Enabled := False;
  DMOracle.DBCemapa.Commit;
end;

procedure TFRequisicaoTransfusaoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBNavigator1.Enabled := True;
  DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.Close;
  DMRequisicaoTransfusao.QRequisicaoTransfusaoItem.open;
end;

procedure TFRequisicaoTransfusaoCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DBNavigator1.Enabled := True;
end;

procedure TFRequisicaoTransfusaoCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DBNavigator1.Enabled := False;
end;

end.
