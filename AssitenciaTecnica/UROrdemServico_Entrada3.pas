unit UROrdemServico_Entrada3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, jpeg, StdCtrls;

type
  TFROrdemServico_Entrada3 = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLNomeRel: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBFone: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRImage1: TQRImage;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel27: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel28: TQRLabel;
    QRShape3: TQRShape;
    QRSysData1: TQRSysData;
    QRMClausulas: TQRMemo;
    QRSemChip: TQRImage;
    QRImage3: TQRImage;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel11: TQRLabel;
    QRComChip: TQRImage;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada3: TFROrdemServico_Entrada3;

implementation

uses UOrdemServico_cl;

{$R *.dfm}

procedure TFROrdemServico_Entrada3.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FROrdemServico_Entrada3.QRMClausulas.Lines.Clear;

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('Cláusula primeira: Dos dados do aparelho (agenda/memória)');
  FROrdemServico_Entrada3.QRMClausulas.Lines.Add(
    '- Estou ciente que poderá ocorrer falhas no equipamento durante sua manutenção sujeito a perda de todos os dados nele gravados;');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('Cláusula segunda: Garantia do serviço');
  FROrdemServico_Entrada3.QRMClausulas.Lines.Add(
    '- Estou ciente que sob os serviços executados haverá 90 (noventa) dias de garantia, salvo quando constatado mal '+
    'uso ou rompimento dos lacres de garantia ou violação por terceiros;');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('Cláusula terceira: Da impossibilidade do conserto ');
  FROrdemServico_Entrada3.QRMClausulas.Lines.Add(
    '- Quando da impossibilidade do conserto, por motivos alheios a nossa vontade, estou de pleno acordo pelo '+
    'recebimento do mesmo não consertado, sem ônus para essa empresa;');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('Cláusula quarta: Da permanência ');
  FROrdemServico_Entrada3.QRMClausulas.Lines.Add(
    '- Estou ciente que não retirando o meu aparelho após o conserto ou orçamento, expirando-se o prazo de '+
    '90 (noventa) dias, autorizo essa empresa a revender o equipamento a fim de cobrir os custos iniciantes;');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('Cláusula quinta: Da procedência do aparelho ');
  FROrdemServico_Entrada3.QRMClausulas.Lines.Add(
    '- Estou ciente que o aparelho será entregue a quem apresentar o canhoto da retirada, ou sem a apresentação '+
    'do mesmo somente será entregue a pessoa previamente identificada na ordem de serviço;');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('');

  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('Cláusula sexta: Do código da defesa do consumidor');
  FROrdemServico_Entrada3.QRMClausulas.Lines.Add('- Declaro também que os efeitos do ' +
	  'código de defesa do consumidor, tive prévio conhecimento de todas as cláusulas e condições rescritas acima.');

  end;
end.
