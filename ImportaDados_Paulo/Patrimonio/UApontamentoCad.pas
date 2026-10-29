unit UApontamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFApontamentoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BTAtividade: TBitBtn;
    BTFuncionario: TBitBtn;
    BTNum_OS: TBitBtn;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    HorasTrabalhadasporfuncionario1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BTNum_OSClick(Sender: TObject);
    procedure BTAtividadeClick(Sender: TObject);
    procedure BTFuncionarioClick(Sender: TObject);
    procedure HorasTrabalhadasporfuncionario1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FApontamentoCad: TFApontamentoCad;

implementation

uses UApontamento_cl, UApontamentoCons, UOSPatrimonioCons, UOSPatrimonio_cl,
  UAtividade_cl, UCadastro_cl, UAtividadeCons, UCadastroCons,
  UPatrimonio_Param, URApontamento, UFFuncionarioCons, UFuncionario_cl;

{$R *.DFM}

procedure TFApontamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMApontamento do
  begin
    QApontamento.Close;
    QApontamento.Open;
  end;
end;

procedure TFApontamentoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
  begin
    BTNum_OS.Enabled:=True;
    BTAtividade.Enabled:=True;
    BTFuncionario.Enabled:=True;
  end
  Else
  begin
    BTNum_OS.Enabled:=False;
    BTAtividade.Enabled:=False;
    BTFuncionario.Enabled:=False;
  end;

end;

procedure TFApontamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FApontamentoCons = Nil then
    FApontamentoCons := TFApontamentoCons.Create(Application);
  If FApontamentoCons.ShowModal = mrOk then
  With DMApontamento do
  Begin
    QApontamento.Close;
    QApontamento.SetVariable('PK',QApontamentoConsCod_Marcacao_Hora.Value);
    QApontamento.Open;
  End;
end;

procedure TFApontamentoCad.BTNum_OSClick(Sender: TObject);
begin
  inherited;
  If FOSPatrimonioCons = Nil then
    FOSPatrimonioCons := TFOSPatrimonioCons.Create(Application);
  If FOSPatrimonioCons.ShowModal = mrOk then
  With DMOSPatrimonio do
  Begin
    DMApontamento.QApontamentoNUM_OS_CAB.Value:=QOSPatrimonioConsNum_OS_Cab.Value;
  End;
end;

procedure TFApontamentoCad.BTAtividadeClick(Sender: TObject);
begin
  inherited;
  If FAtividadeCons = Nil then
    FAtividadeCons := TFAtividadeCons.Create(Application);
  If FAtividadeCons.ShowModal = mrOk then
  With DMAtividade do
  Begin
    DMApontamento.QApontamentoCod_Atividade_Cab.Value:=QAtividadeConsCod_Atividade_Cab.Value;
  End;
end;

procedure TFApontamentoCad.BTFuncionarioClick(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.ShowModal = mrOk then
  With DMFuncionario do
  Begin
    DMApontamento.QApontamentoCod_Funcionario.Value:=QFuncionarioConsCod_Funcionario.Value;
  End;
end;

procedure TFApontamentoCad.HorasTrabalhadasporfuncionario1Click(
  Sender: TObject);
var
  wTotal_Horas :TDateTime;
begin
  inherited;
  wTotal_Horas:=0;
  If FPatrimonio_Param = Nil then
    FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[6].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  begin
    if Trim(FPatrimonio_Param.ME7Funcionario.Text)<>'' then
    begin
      with DMApontamento do
      begin
        QRApontamento.close;
        QRApontamento.setVariable('COD_FUNCIONARIO',Trim(FPatrimonio_Param.ME7Funcionario.Text));
        QRApontamento.setVariable('DT_MARCACAO_I',Trim(FPatrimonio_Param.ME7DT_Marcacao_I.Text));
        QRApontamento.setVariable('DT_MARCACAO_F',Trim(FPatrimonio_Param.ME7DT_Marcacao_F.Text));
        QRApontamento.open;
        QRApontamento.First;
        if FRApontamento = nil then
          FRApontamento := TFRApontamento.Create(Application);
        while not(QRApontamento.eof) do
        begin
          wTotal_Horas:=wTotal_Horas+StrToTime(QRApontamentoDesc_Hora_Termino.Value)-StrToTime(QRApontamentoDesc_Hora_Ini.Value);
          QRApontamento.next;
        end;
        FRApontamento.QRLHora.Caption:=(TimeToStr(wTotal_Horas));
      end;
      FRApontamento.QRPrimario.Preview;
    end
    else
       showmessage('Deve ser escolhido um Funcionario');
  end;
end;
end.
